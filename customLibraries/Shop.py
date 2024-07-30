from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

     #directly apply custom keywords -> in testcase steps
    # use -> self.selLib.<able to use sel keywords>
     # method name will be converted to keyword name
    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def select_the_particular_item(self, product_name):
        # Get WebElements
        i = 1
        productsTitles = self.selLib.get_webelements(" css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in product_name:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[" + str(i) + "]/button")

            i = i + 1

        self.selLib.click_link("css:li.active a")