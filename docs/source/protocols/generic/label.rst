.. |yes| image:: ../../images/yes.png
.. |no| image:: ../../images/no.png

.. role:: underline
   :class: underline

Label
=====

+------------------+-------------+
| **Feature**      | **Support** |
+------------------+-------------+
| Sending          | |yes|       |
+------------------+-------------+
| Receiving        | |no|        |
+------------------+-------------+
| Config           | |yes|       |
+------------------+-------------+

.. rubric:: Supported Brands

*None*

.. rubric:: Sender Arguments

.. code-block:: console

   -i --id=id               control a device with this id
   -l --label=label         show a specific label
   -c --color=color         give the label a specific color
   -b --blink=on|off        enable or disable blinking of the label
   -g --bgcolor=color       give the label a specific background color


.. rubric:: Config

.. code-block:: json
   :linenos:

   {
     "devices": {
       "label": {
         "protocol": [ "generic_label" ],
         "id": [{
           "id": 100
         }],
         "label": "test1234",
         "color": "#FFFFFF",
         "bgcolor": "#FF0000"
         "blink": "off"
       }
     },
     "gui": {
       "label": {
         "name": "Label",
         "group": [ "Living" ],
         "media": [ "all" ]
       }
     }
   }

+------------------+----------------------+
| **Option**       | **Value**            |
+------------------+----------------------+
| id               | 0 - 99999            |
+------------------+----------------------+
| label            | *any value*          |
+------------------+----------------------+
| color            | *any color*          |
+------------------+----------------------+

.. note::

   Please notice that the label color is not validated in any way. The color information is just forwarded to the GUIs as is. So it could be that some GUIs do not support certain color naming. Using hex colors is therefore the safest, e.g. #000000.

.. versionadded:: 8.0

+------------------+----------------------+
| **Option**       | **Value**            |
+------------------+----------------------+
| blink            | on / off             |
+------------------+----------------------+
| bgcolor          | *any color*          |
+------------------+----------------------+
.. note::

   The blink- and bgcolor options are optional, but must be configured if blinking or setting the background color of the label is desired.
   
  Please notice that also the background color is not validated in any way. See the note for the color option above.
