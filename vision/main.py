from flask import Flask, request
import requests
from PIL import Image
import io
import os
from ultralytics import YOLO


app = Flask(__name__)

@app.route('/getDetectedIngredients', methods=['POST'])
def getDetectedIngredients():

    data = request.get_json()

    api_url = f"http://localhost:8080/api/imagestorage/{data['id']}"
    image_data = requests.get(api_url).content
    image = Image.open(io.BytesIO(image_data))
    allPath = os.path.join("image","testImg.png")
    print(allPath)
    image.save(allPath)

    '''
        image resmi mobilden gelen resmi içeriyor. image/testImg olarak da kayıt edildi.
    '''
    model = YOLO('best.pt')
    #results = model(allPath, conf=0.25, save=True)

    results = model.predict(allPath, conf=0.25, save=True)
    list = results[0].boxes.cls.tolist()

    return list

if __name__ == '__main__':
    app.run(debug=True)
