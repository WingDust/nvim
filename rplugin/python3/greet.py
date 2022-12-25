
from pystardict import Dictionary

from notifypy import Notify


import pynvim
# [PynvimTest.nvim](https://github.com/Chatyusha/PynvimTest.nvim/blob/master/rplugin/python3/pynvimtest/__init__.py)
from pynvim.api.nvim import Nvim

import sys
import os
import platform 

if platform.system().lower()=='windows':
    cn2en_dict = Dictionary("C:/Users/Administrator/AppData/Local/nvim/rplugin/python3/stardict-oxford-gb-formated-2.4.2/oxford-gb-formated")
elif platform.system().lower()=='linux': 
    pass

elif platform.system().lower()=='darwin': 
    pass

# 取消使用 pyttsx3 做语音，改用 playwright




@pynvim.plugin
class Greeting(object):

    def __init__(self, nvim:Nvim):
        self.nvim =  nvim

    @pynvim.command('Greet', range='', nargs='*', sync=True)
    def command_handler(self, args, range):
        run = sys.path[0]
        d = cn2en_dict["你好"]
        self.nvim.command(f'echo "{d}"')

    @pynvim.command('Dict', nargs='*' )
    def command_handler(self, *args ):
        d = cn2en_dict[str(args[0][0])]
        self.nvim.command(f'echo "{d}"')

    @pynvim.command('TestCommandWithArgs',nargs='*')
    def testcommand_with_args(self,*args):
        self.nvim.out_write("Command Call : 'TestCommandWithArgs' and \nargs : " + str(args) + "\n")
        # notification = Notify()
        # notification.title = "Cool Title"
        # notification.message = "Even cooler message."
        # notification.send()

# if __name__ == "__main__":
#
