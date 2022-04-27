# qb-printer
Printer For QB-Core

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>


* ATTENTION: To have this working correctly you MUST change shared.lua as follows: `Search for "printerdocument" and make ["unique"] = true` otherwise documents WILL STACK and You'll be able to see only latest.

* Config for the Key to use the printer added....Didn't make it a KeyBind since it's not really gonna be used a lot.
* Config for Text shown when closeby a printer.
* Config table for valid extensions added.
* Added an error notification if url doesn't end with a valid extension from the table on the config file.
* To change DEFAULT printerdocument's image navigate to qb-inventory/server/main.lua:1549 and change `info.url = "https://cdn.discordapp.com/attachments/645995539208470549/707609551733522482/image0.png"` default URL there.
