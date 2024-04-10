try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False

@keyword("IMPLICIT WAIT")
def implicitWait(duration):
     driver = BuiltIn().get_library_instance('AppiumLibrary')._current_application()
     driver.implicitly_wait(duration)  # waits 5 seconds