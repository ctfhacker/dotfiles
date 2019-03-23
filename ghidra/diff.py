import xml.etree.ElementTree as ET

keys = {
  3: 'break',
  8: 'backspace / delete',
  9: 'tab',
  12: 'clear',
  13: 'enter',
  16: 'shift',
  17: 'ctrl',
  18: 'alt',
  19: 'pause/break',
  20: 'caps lock',
  21: 'hangul',
  25: 'hanja',
  27: 'escape',
  28: 'conversion',
  29: 'non-conversion',
  32: 'spacebar',
  33: 'page up',
  34: 'page down',
  35: 'end',
  36: 'home',
  37: 'left arrow',
  38: 'up arrow',
  39: 'right arrow',
  40: 'down arrow',
  41: 'select',
  42: 'print',
  43: 'execute',
  44: 'Print Screen',
  45: 'insert',
  46: 'delete',
  47: 'help',
  48: '0',
  49: '1',
  50: '2',
  51: '3',
  52: '4',
  53: '5',
  54: '6',
  55: '7',
  56: '8',
  57: '9',
  58: ':',
  59: 'semicolon',
  60: '<',
  61: 'equals',
  65: 'a',
  66: 'b',
  67: 'c',
  68: 'd',
  69: 'e',
  70: 'f',
  71: 'g',
  72: 'h',
  73: 'i',
  74: 'j',
  75: 'k',
  76: 'l',
  77: 'm',
  78: 'n',
  79: 'o',
  80: 'p',
  81: 'q',
  82: 'r',
  83: 's',
  84: 't',
  85: 'u',
  86: 'v',
  87: 'w',
  88: 'x',
  89: 'y',
  90: 'z',
  127: 'DELETE',
  161: 'BRACELEFT',
  162: 'BRACERIGHT',
  114: 'F4',
  117: 'F6',
  118: 'F7',
  119: 'F8',
  120: 'F9',
  122: 'F11',
  123: 'F12',
  521: 'PLUS',
  222: 'QUOTE',
  91: 'OPEN_BRACKET',
}

modifiers = {
    65: 'SHIFT'
}

orig_bindings = {}

tree = ET.parse("orig_bindings.kbxml")
root = tree.getroot()

for elem in root:
    name = elem.attrib['NAME']
    keycode = -1
    modifier = -1
    for sub in elem:
        if sub.attrib['NAME'] == 'KeyCode':
            res = int(sub.attrib['VALUE'])
            if res == 0:
                break
            keycode = keys.get(res, res).upper()
        if sub.attrib['NAME'] == 'Modifiers':
            modifier = modifiers.get(int(sub.attrib['VALUE']), '')

    if modifier:
        keystroke = '{}+{}'.format(modifier, keycode)
    else:
        keystroke = '{}'.format(keycode)

    orig_bindings[name] = keystroke

tree = ET.parse("ctfhacker_bindings.kbxml")
root = tree.getroot()

for elem in root:
    name = elem.attrib['NAME']
    keycode = -1
    modifier = -1
    for sub in elem:
        if sub.attrib['NAME'] == 'KeyCode':
            res = int(sub.attrib['VALUE'])
            if res == 0:
                break
            keycode = keys.get(res, res).upper()
        if sub.attrib['NAME'] == 'Modifiers':
            modifier = modifiers.get(int(sub.attrib['VALUE']), '')

    if modifier:
        keystroke = '{}+{}'.format(modifier, keycode)
    else:
        keystroke = '{}'.format(keycode)

    if orig_bindings.get(name, '_') != keystroke:
        print("{}: {} -> {}".format(name, orig_bindings.get(name, '_'), keystroke))
