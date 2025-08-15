from app_ver1 import app

def test_home():
    client = app.test_client()
    response = client.get('/')
    assert response.status_code == 200
    assert b'Hello World' in response.data

def test_greet():
    client = app.test_client()
    response = client.get("/greet/Sree")
    assert response.code == 200
    assert b 'Hello, Sree' in response.data

