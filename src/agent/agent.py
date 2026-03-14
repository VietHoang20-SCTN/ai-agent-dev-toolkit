class Agent: 
    def __init__(self, tools=None): 
        self.tools = tools or [] 
 
    def run(self, input_text): 
        return f"Agent response: {input_text}" 
