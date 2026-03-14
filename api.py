from fastapi import FastAPI 
from src.agent.openai_agent import OpenAIAgent 
 
app = FastAPI() 
agent = OpenAIAgent() 
 
@app.get("/chat") 
def chat(prompt: str): 
    return {"response": agent.run(prompt)} 
