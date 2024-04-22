from flask import Flask, request
import requests
from PIL import Image
import io
import os


app = Flask(__name__)

@app.route('/getDetectedIngredients', methods=['POST'])
def getDetectedIngredients():

    data = request.get_json()

    api_url = f"http://localhost:8080/api/imagestorage/{data['id']}"
    image_data = requests.get(api_url).content
    image = Image.open(io.BytesIO(image_data))
    allPath = os.path.join("image","testImg.png")
    image.save(allPath)

    '''
        image resmi mobilden gelen resmi içeriyor. image/testImg olarak da kayıt edildi.
    '''

    list = ["Domates", "Patlıcan"]
    return list

if __name__ == '__main__':
    app.run(debug=True)