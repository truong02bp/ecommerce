from ecommerce.models import Producer


class ProducerService:
    __instance = None

    def __init__(self):
        ProducerService.__instance = self

    @staticmethod
    def get_instance():
        if ProducerService.__instance is None:
            ProducerService()
        return ProducerService.__instance

    def find_all(self):
        return Producer.objects.all()
