import google.generativeai as genai

def get_solutions(disease_name: str)-> str:
    print(f"==finding solution for  {disease_name}===")
    genai.configure(api_key='')
    model = genai.GenerativeModel('gemini-pro')
    response = model.generate_content(f"""Hey AI, we've developed a plant disease detection system that accurately predicts {disease_name} affecting crops. Now, we're seeking solutions to mitigate this disease effectively. Could you please provide insights or recommendations on how we can combat {disease_name}? We're particularly interested in sustainable and environmentally friendly approaches, including but not limited to organic treatments, cultural practices, biological controls, or innovative technologies. Your suggestions will help us develop a comprehensive strategy to protect our crops and ensure food security.""")
    print("==Got the solution===")
    return response.text
