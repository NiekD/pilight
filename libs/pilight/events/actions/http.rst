.. |yes| image:: ../../images/yes.png
.. |no| image:: ../../images/no.png

.. role:: underline
   :class: underline

Http
========
.. versionadded:: 8.1.1

.. rubric:: Description

Send an http(s) GET or POST request

.. rubric:: Options for GET

+----------+------------------+---------------------+-----------------------------------------------+
| **Name** | **Required**     | **Multiple Values** | **Description**                               |
+----------+------------------+---------------------+-----------------------------------------------+
| GET      | |yes|            | |no|                | The url for a GET request                     |
+----------+------------------+---------------------+-----------------------------------------------+
| PARAM    | |no|             | |no|                | An optional parameterstring for a GET request |
+----------+------------------+---------------------+-----------------------------------------------+

.. rubric:: Options for POST

+----------+------------------+---------------------+-----------------------------------------------+
| **Name** | **Required**     | **Multiple Values** | **Description**                               |
+----------+------------------+---------------------+-----------------------------------------------+
| POST     | |yes|            | |no|                | The url for a POST request                    |
+----------+------------------+---------------------+-----------------------------------------------+
| PARAM    | |yes|            | |no|                | A parameterstring required for a POST request |
+----------+------------------+---------------------+-----------------------------------------------+
| MIMETYPE | |yes|            | |no|                | The mimetype required for a POST request      |
+----------+------------------+---------------------+-----------------------------------------------+

.. rubric:: Examples

.. code-block:: console

   IF 1 == 1 THEN http GET 'http://www.somewebsite.com/'
   
   IF 1 == 1 THEN http GET 'https://www.somewebsite.com/' PARAM 'command=show&format=xml'
   
   IF 1 == 1 THEN http POST 'http://www.somewebsite.com/' PARAM 'command=show' MIMETYPE 'text/plain'
   
   IF 1 == 1 THEN http GET 'http://192.168.1.1/myserver/' 