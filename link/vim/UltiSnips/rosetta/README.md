
# Rosetta stone document #

This is the manifest to implement a set of common snippets that should be appliable to all programing languages.

|--------------+----------------------------------+------+----+---+--++-+----+------+---------+------+-----------+---------+-------+------+------|
| Snippet name | Description                      | bash | py | c | c++ | js | node | fortran | ruby | asymptote | gnuplot | swift | java | perl |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| TYPES        |                                  |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| fun          | Simple function definition       | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| lambda       | Lambda expression                |      |    |   |     |    |      |         |      |           |         |       |      |      |
| class        | Class definition                 |      |    |   |     |    |      |         |      |           |         |       |      |      |
| met          | Method of a class                |      |    |   |     |    |      |         |      |           |         |       |      |      |
| attr         | attribute of a class             |      |    |   |     |    |      |         |      |           |         |       |      |      |
| const        | Read-only variale                | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| macro        | C-like macro                     |      |    |   |     |    |      |         |      |           |         |       |      |      |
| int          | Simple integer definition        | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| float        | Simple floating point definition |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| double       | Double precission                |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| char         | Character definition             | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| str          | string definition                | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| dic          | Relational array                 |      |    |   |     |    |      |         |      |           |         |       |      |      |
| arr          | List of values                   | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| enum         | Enumeration definition           |      |    |   |     |    |      |         |      |           |         |       |      |      |
| struct       | Structure construct              |      |    |   |     |    |      |         |      |           |         |       |      |      |
| type         | Define custom type               |      |    |   |     |    |      |         |      |           |         |       |      |      |
| bin          | Binary numbers                   |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| hex          | Hexadecimal numbers              | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| octal        | Octal numbers                    |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| bool         | Boolean variables                |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| name         | Namespace                        |      |    |   |     |    |      |         |      |           |         |       |      |      |
| module       | Define module, package etc..     |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| c<TYPE>      | Constant type definition         |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| t<TYPE>      | Type safe definition             |      |    |   |     |    |      |         |      |           |         |       |      |      |
| ct<TYPE>     | Constant type safe definition    |      |    |   |     |    |      |         |      |           |         |       |      |      |
| a<TYPE>      | Array 1-D type definition        |      |    |   |     |    |      |         |      |           |         |       |      |      |
| ca<TYPE>     | Array 1-D type definition        |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| BRANCHING    |                                  |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| if           | If construct                     | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| ife          | If else construct                | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| elif         | elif                             | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| ifsh         | If construct, short form         | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| if3          | if construct tertiary form       | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| for          | for with index                   | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| fori         | iterator, for smth in smwhr      | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| while        | While                            | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| until        | until                            | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| case         | case                             |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| try          | Try / catch                      |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| UTILS        |                                  |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| new          | Instantiate object               |      |    |   |     |    |      |         |      |           |         |       |      |      |
| pac          | Include some package             | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| so           | print to stdout                  | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| serr         | print to stderr                  | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| sex          | Raise exception                  |      |    |   |     |    |      |         |      |           |         |       |      |      |
| read         | stdin read                       | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| cd           | Change dir                       | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| sys          | Talk to the shell                |      |    |   |     |    |      |         |      |           |         |       |      |      |
| mkdir        | Create directory                 | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| cp           | Copy a file                      |      |    |   |     |    |      |         |      |           |         |       |      |      |
| cp-r         | Copy dir                         |      |    |   |     |    |      |         |      |           |         |       |      |      |
| fopen        | File open                        |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| fclose       | File open                        |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| fwrite       | File write                       |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| fread        | File read                        |      |    |   |     |    |      | X       |      |           |         |       |      |      |
| exit         | Exit a program with status       | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| ret          | Return a value in function       | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| argc         | Get arguments number             | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| argvi        | Get ith argument                 | X    |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| CONSTANTS    |                                  |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| true         | True variable                    | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| false        | False keyword                    | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| and          | and operator                     | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| or           | Or operator                      | X    |    |   |     |    |      | X       |      |           |         |       |      |      |
| bor          | Bitwise or                       | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| band         | Bitwise and                      | X    |    |   |     |    |      |         |      |           |         |       |      |      |
| NaN          | Not a number                     |      |    |   |     |    |      |         |      |           |         |       |      |      |
| null         | Undefined variable               |      |    |   |     |    |      |         |      |           |         |       |      |      |
| EOF          | end of file character            |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| TEMPLATES    |                                  |      |    |   |     |    |      |         |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|
| argv parse   | Parse command line               |      |    |   |     |    |      |         |      |           |         |       |      |      |
| main         | Main template                    |      |    |   |     |    |      | X       |      |           |         |       |      |      |
|--------------+----------------------------------+------+----+---+-----+----+------+---------+------+-----------+---------+-------+------+------|

