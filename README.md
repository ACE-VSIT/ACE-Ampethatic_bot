# ace_bot

Empathetic Chat Bot which can help users in dealing with emotional stress

Empathetic Bot

Team Members:
- Sarthak Vaswani
- Kirtivardhan Singh
- Dev Verma
	
## Title: Combining multiple AI models to implement an AI most suitable for the creation of a personalized conversational Bot that can help users in dealing with emotional stress and anxiety. 

### Abstract:

Many types of research have been done on Empathetic Bots, on how to make them more humanized, and creating an effective bot to deal with Human emotions and situations which require someone to talk to.
Still, their effectiveness in dealing has not been remarkable. So to add on or improve on already models, we are observing how the models interact differently or respond with different persons and how effective they are in certain situations. To enhance technology with digital health.

### Objectives:
Combining multiple conversational AI models to achieve the most effective results for the empathetic bot.
Personalizing the bot - to know and memorize the nature of the person the bot is chatting with.
Check for chat patterns to decide whether a user is under mental stress and hence effectively communicate.
To check the effectiveness of bot in real chat scenarios.
To replicate the human feel to talk with someone who is in a distressed situation or dealing with anxiety.

### What we have done :

Implemented and tested multiple models for the AI(OpenAI GPT, seq to seq,  transfer learning, persona chat)
All AI implementation was done using Python.
Developed a mobile and Web App for chatting with the bot. 
Web Backend is implemented with Flask.
For Frontend, Flutter is used to create a minimalist UI which helps in providing a pleasing experience and to minimize the number of click ratios to provide a seamless interface.


## Implementation:

### Backend:
Multiple models were tested for the conversational AI :
Seq to Seq model on reddit chat data 
Seq to Seq model on kaggle chat data
Facebook’s Persona chat model
HuggingFace’s transfer learning models based on OpenGPT
HuggingFace’s model seemed to be most efficient for the project.
Thus, a HuggingFace model was implemented using the persona chat data, creating a conversational bot AI which currently changes personality everytime a new script is run. This Ai was wrapped using flask to create an API which can be used to chat with the bot.

### Mobile App-
Mobile App is developed with Flutter.
Flask API is used for connecting to the Bot server.
Data Messages are parsed in JSON format and then sent to the server and again bot replies which are converted in JSON format.

Flutter Mobile App Code - SarthakVaswani/ace_bot (github.com)


Future Research Areas:

### Web Application
Creation of a new model based on this research
To emulate a more human-based voice system, where the bot speaks, but with a more humanized tone. This would help to examine how the results differ when a person feeling distressed talks to a human-like avatar.
To develop a Virtual reality experience, where the bot has a virtual avatar, helping in providing a more personalized experience.

### References:

- How to build a State-of-the-Art Conversational AI with Transfer Learning - https://medium.com/huggingface/how-to-build-a-state-of-the-art-conversational-ai-with-transfer-learning-2d818ac26313
- Generative chatbots using the seq2seq model! - https://towardsdatascience.com/generative-chatbots-using-the-seq2seq-model-d411c8738ab5
- A Repository of Conversational Datasets - https://arxiv.org/abs/1904.06472
- CAiRE: An Empathetic Neural Chatbot - https://arxiv.org/abs/1907.12108
- Facebook Empathetic dialogues GitHub repository - https://github.com/facebookresearch/EmpatheticDialogues
- Reddit comments directory for data - http://files.pushshift.io/reddit/comments/
- Flask API with Flutter - Flutter Chatbot with Python (Flask) Backend+Heroku Deployment | by Python Zimbabwe Open Source | Medium



