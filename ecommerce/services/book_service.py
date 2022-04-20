from ecommerce.models import Book


class BookService:
    __instance = None

    def __init__(self):
        BookService.__instance = self

    @staticmethod
    def get_instance():
        if BookService.__instance is None:
            BookService()
        return BookService.__instance

    def find_all(self):
        return Book.objects.all()

    def find_limit(self, counter):
        return Book.objects.all().order_by('id')[:counter]
