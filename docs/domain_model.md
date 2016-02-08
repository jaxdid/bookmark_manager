Domain Model

Objects                 Messages
================================
User                    keep track
List                    view
Links                   add
Tags                    place tag
                        filter



User (interface) ---> view   ---> list
Links            ---> add    ---> list
Tags             ---> place  ---> links
User (interface) ---> filter ---> list
