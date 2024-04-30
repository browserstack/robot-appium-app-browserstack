from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword

@keyword("TEST STATUS")
def testStatus(status, reason):
     driver = BuiltIn().get_library_instance('AppiumLibrary')._current_application()
     driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"'+status+'", "reason": "'+reason+'"}}')
