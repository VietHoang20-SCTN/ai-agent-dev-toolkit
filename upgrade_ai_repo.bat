@echo off
title Upgrade AI Agent Repo PRO

echo ==================================
echo UPGRADING AI AGENT PROJECT
echo ==================================

echo.
echo Creating new modules...

mkdir src\agent
mkdir src\memory
mkdir src\tools
mkdir src\plugins

echo.
echo Creating OpenAI Agent...

echo import os > src\agent\openai_agent.py
echo from openai import OpenAI >> src\agent\openai_agent.py
echo. >> src\agent\openai_agent.py
echo client = OpenAI() >> src\agent\openai_agent.py
echo. >> src\agent\openai_agent.py
echo class OpenAIAgent: >> src\agent\openai_agent.py
echo     def run(self, prompt): >> src\agent\openai_agent.py
echo         response = client.chat.completions.create( >> src\agent\openai_agent.py
echo             model="gpt-4.1-mini", >> src\agent\openai_agent.py
echo             messages=[{"role":"user","content":prompt}] >> src\agent\openai_agent.py
echo         ) >> src\agent\openai_agent.py
echo         return response.choices[0].message.content >> src\agent\openai_agent.py

echo.
echo Creating CLI tool...

echo from src.agent.openai_agent import OpenAIAgent > cli.py
echo. >> cli.py
echo agent = OpenAIAgent() >> cli.py
echo. >> cli.py
echo while True: >> cli.py
echo     prompt = input("You: ") >> cli.py
echo. >> cli.py
echo     if prompt == "exit": >> cli.py
echo         break >> cli.py
echo. >> cli.py
echo     response = agent.run(prompt) >> cli.py
echo     print("Agent:", response) >> cli.py

echo.
echo Creating FastAPI API...

echo from fastapi import FastAPI > api.py
echo from src.agent.openai_agent import OpenAIAgent >> api.py
echo. >> api.py
echo app = FastAPI() >> api.py
echo agent = OpenAIAgent() >> api.py
echo. >> api.py
echo @app.get("/chat") >> api.py
echo def chat(prompt: str): >> api.py
echo     return {"response": agent.run(prompt)} >> api.py

echo.
echo Updating requirements...

echo openai > requirements.txt
echo fastapi >> requirements.txt
echo uvicorn >> requirements.txt
echo pydantic >> requirements.txt

echo.
echo Updating README...

echo. >> README.md
echo ## Features >> README.md
echo - AI Agent Framework >> README.md
echo - OpenAI integration >> README.md
echo - CLI agent >> README.md
echo - FastAPI chatbot API >> README.md
echo - Plugin system >> README.md

echo.
echo Adding files to git...

git add .

echo.
echo Commit upgrade...

git commit -m "upgrade repo with OpenAI agent, CLI interface and FastAPI API"

echo.
echo Pushing to GitHub...

git push

echo.
echo ==================================
echo UPGRADE COMPLETE
echo ==================================

pause