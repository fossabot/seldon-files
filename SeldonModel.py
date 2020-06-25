import torch
import os
# from seldon_core.user_model import SeldonComponent

class SeldonModel:
    def __init__(self):
        self.model = torch.load(os.environ.get('WEIGHTS_PATH'),
                                map_location=torch.device('cpu'))

        self.model.eval()


    def predict(self, X, features_names, **kwargs):
        inp = torch.Tensor(X)
        with torch.no_grad():
            return self.model(inp).numpy()