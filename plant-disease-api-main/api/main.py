from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import numpy as np
from io import BytesIO
from PIL import Image
import requests
import gimini_ai


app = FastAPI()

endpoint = "http://44.209.119.96:8601/v1/models/plant_disease:predict"

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


CLASS_NAMES = ["Early Blight", "Late Blight", "Healthy", "Apple___Apple_scab", "Apple___healthy", "Grape___Leaf_blight_(Isariopsis_Leaf_Spot)",
               "Grape___healthy"]

@app.get("/ping")
async def ping():
    return "Hello, Deep You Are Welcome" 

def read_file_as_image(data) -> np.ndarray:
    image = np.array(Image.open(BytesIO(data)))
    return image

@app.post("/predict")
async def predict(
    file: UploadFile = File(...)
):
    image = read_file_as_image(await file.read())
    img_batch = np.expand_dims(image, 0)
    json_data = {
        "instances": img_batch.tolist()
    }
    # print(json_data)
    
    response = requests.post(endpoint, json=json_data)
    prediction = np.array(response.json()["predictions"][0])

    predicted_class = CLASS_NAMES[np.argmax(prediction)]
    confidence = np.max(prediction)
    # get solution from ai
    solution = gimini_ai.get_solutions(predicted_class)
    return {
        'class': predicted_class,
        'confidence': float(confidence),
        'solution': solution
    }

if __name__ == "__main__":
    uvicorn.run(app, host='127.0.0.1', port=8000)