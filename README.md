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


* I have used redis as a persistent cache storage. Rails is key-value store and it has built-in store for data structures like        list,hashes and it can persist the data. One can start the server by running the command redis-server.

* Once we translate a new text by giving the appropriate the target language, i am storing the translated text in the cache. Then , if one tries to translate the same text with the same targeted language as before, am fetching the text from the cache.