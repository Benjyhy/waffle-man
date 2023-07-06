import json
from pprint import pprint as pp
from locust import HttpUser, task, constant


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

        if (self.products < 4000):
            response = self.client.post("/api/product", headers=headers, data=json.dumps(payload))
            pp(response)
            data = response.json()
            if data["status"] == "ok":
                self.products = 1

    @task
    def getProductFromServer(self):
        if self.products != 0:
            self.client.get("/api/product?q=")

    @task
    def getProductFromClient(self):
        self.client.get("/")
