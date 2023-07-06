import json
from locust import HttpUser, task, constant
from pprint import pprint as pp

class cacheService(HttpUser):

    wait_time = constant(1)
    products = 0

    @task
    def postProduct(self):
        payload = {
            "name": "name",
            "description": "description",
            "image": "https://cdn2.thecatapi.com/images/746.jpg"
        }

        headers = { 
            "Content-type": "application/json",
            "Accept": "application/json, text/plain, */*"
        }

        response = self.client.post("/api/product", headers=headers, data=json.dumps(payload))
        data = response.json()
        if(data["status"] == "ok"):
            self.products = 1
    
    @task
    def getProductFromServer(self):
        if self.products != 0:
            self.client.get("/api/product?q=")

    @task
    def getProductFromClient(self):
        self.client.get("/")
