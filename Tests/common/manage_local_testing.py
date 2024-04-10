import os
from robot.api.deco import keyword
from browserstack.local import Local

access_key = os.getenv("BROWSERSTACK_ACCESS_KEY")
bs_local = Local()

@keyword("START LOCAL")
def startLocal():
    bs_local_args = {"key": access_key}
    bs_local.start(**bs_local_args)
    print(bs_local.isRunning())

@keyword("STOP LOCAL")
def stopLocal():
    bs_local.stop()
