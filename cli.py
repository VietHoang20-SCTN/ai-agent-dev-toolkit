from src.agent.openai_agent import OpenAIAgent 
 
agent = OpenAIAgent() 
 
while True: 
    prompt = input("You: ") 
 
    if prompt == "exit": 
        break 
 
    response = agent.run(prompt) 
    print("Agent:", response) 
