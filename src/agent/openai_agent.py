import os 
from openai import OpenAI 
 
client = OpenAI() 
 
class OpenAIAgent: 
    def run(self, prompt): 
        response = client.chat.completions.create( 
            model="gpt-4.1-mini", 
            messages=[{"role":"user","content":prompt}] 
        ) 
        return response.choices[0].message.content 
