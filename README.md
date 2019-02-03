# README

Rails application for Text Translator using Google translator library

This is a list of steps to do:

* Set up the project locally
* Start the application and run the API's in postman to see the working


Assumptions:

* Ruby is installed (v 2.5.0)
* Rails is installed (v 5.2.2)
* Git is installed
* Github account is established


Set up the project locally:

* git clone git@github.com:SwathiSathish/text-translator.git 
* cd text-translator
* bundle
* rails server


List of API's

1) To translate the given text to a desired language
* {{local}}/translator/translate  # Params to be passed while executing the API. Example: {text: "Hello world", target: "hi"}

2) List of all supported languages
* {{local}}/translator/supported_languages   # Params to be passed while executing the API. Example: {code: "hi"}


About the Application: 


* Here, redis has been used as a persistent cache storage. Redis is key-value store and it has built-in store for data structures like list,hashes and it can persist the data. One can start the server by running the command redis-server.

* Once we translate a new text by giving the appropriate the target language, application stores the translated text in the cache. Then , if one tries to translate the same text with the same targeted language as before, then the text is been fetched from the cache.


* For Smart pre caching, as per the requirenment, I would like to share my thoughts. If a user translates a text into kannada, he is likely to also translate the same text to hindi. For this, we might have to get the user's location. Based on that, we could get the regional languages. Once we get the languages, the text can be converted to respective languages and stored in the cache.