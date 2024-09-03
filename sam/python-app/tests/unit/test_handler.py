import json

import pytest

from hello_world import app


@pytest.fixture()
def event():
    return {}

@pytest.fixture()
def context():
    return {}

def test_lambda_handler(event, context):

    ret = app.lambda_handler(event, "")
    data = json.loads(ret["body"])

    assert ret["statusCode"] == 200
    assert "message" in ret["body"]
    assert data["message"] == "hello world"
