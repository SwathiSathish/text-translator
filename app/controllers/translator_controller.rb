class TranslatorController < ApplicationController
  PROJECT_ID = ENV["CLOUD_PROJECT_ID"]

  def translate
  	translate = Google::Cloud::Translate.new project: PROJECT_ID
  	text = params[:text]
  	target =  params[:target]
  	find_in_cache = $redis.get('translate')
  	if find_in_cache.present? && JSON.parse(find_in_cache)["to"] == params[:target]
  		render json: {data: JSON.parse(find_in_cache), message: "Fetching from cache"}, status: :ok
	else
		translation = translate.translate text, to: target 
		$redis.set('translate', translation.to_json)
		render json: {data: {text: "#{text}", from: translation.from,translation: "#{translation}", to: translation.to, 
							model: translation.model}}, status: :ok
	end
  end


  def supported_languages
  	project_id = ENV["CLOUD_PROJECT_ID"]
	language_code = 'en'

	translate = Google::Cloud::Translate.new project: PROJECT_ID
	languages = translate.languages params[:code]
	all_languages = []

	languages.each do |language|
		all_languages << language
	end
	render json: {data: all_languages}
  end

end