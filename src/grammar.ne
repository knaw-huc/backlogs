Sourcefile -> COMMENTS:? EMPTY:* SECTION:+ PROJECTSECTION EMPTY:*                         {% function (d) { const result = {"projects": d[3]}; for (const it of d[2]) { result[it.title] = it.tasks }; return result  } %}

SECTION -> SECTIONHEADER TASK_OR_BLOCK:*                                                  {% d => ( {type: "section", title: d[0], tasks: d[1] } ) %}

SECTIONHEADER -> "# " ("in work" | "up next" | "archive") "\n"                            {% d => d[1][0] %}

TASK[prefix] -> $prefix MARKER " " CHECKBOX " " ID ": " TITLE TASKDESC[$prefix]:*         {% ([prefix, marker, space1, checkbox, space, taskId, colon, title, taskdesc]) => ( {type: "task", title: title, id: taskId, status: checkbox, tentative: marker, description: taskdesc.length > 0 ? taskdesc.join("\n") : undefined} ) %}
MARKER -> ("-" | "~" )                                                                    {% d => d[0][0] === "~" %}
ID -> [a-zA-Z0-9_-]:+                                                                     {% d => d[0].join("") %}
CHECKBOX -> ("[ ]" | "[X]" | "[-]")                                                       {% d => d[0][0] === "[X]" ? "CLOSED" : d[0][0] === "[-]" ? "CANCELLED" : "OPEN" %}
TITLE -> .:+ "\n"                                                                         {% d => d[0].join("") %}
TASKDESC[prefix] -> $prefix " ":* "> " [^\n]:* "\n"                                       {% d => d[3].join("") %}

TASK_OR_BLOCK -> (TASK["  "] | BLOCK)                                                     {% d => d[0][0] %}

BLOCK -> BLOCKHEADER BLOCKBODY:* TASK["    "]:*                                           {% d => ({type: "work-unit", id: d[0].id, version: d[0].version, label: d[0].label, description: d[1].join("\n"), tasks: d[2] }) %}
BLOCKHEADER -> "  " BLOCKID BLOCKDESCRIPTION "\n"                                         {% ([space, id, desc]) => ({id: id, version: desc.version, label: desc.title}) %}
BLOCKID -> [a-zA-Z0-9_-]:+                                                                {% d => d[0].join("") %}
BLOCKDESCRIPTION -> ": " BLOCKTITLE BLOCKVERSION:?                                        {% ([colon, title, version]) => ({title: title, version: version}) %}
BLOCKTITLE -> [^(\n]:+                                                                    {% d => d[0].join("") %}
BLOCKVERSION -> " ":? "(" [^)]:+ ")"                                                      {% ([space, leftparen, version, rightparen]) => version.join("") %}
BLOCKBODY -> "  > " [^\n]:* "\n"                                                          {% d => d[1].join("") %}

COMMENTS -> "//" [^\n]:* "\n"                                                             {% d => ( {type: "comment", text: d[1].join("") } ) %}
EMPTY -> [ \t]:* "\n"                                                                     {% d => null %}

PROJECTSECTION -> "# projects\n" PROJECTLIST:+                                            {% ([header, projectList]) => projectList %}

PROJECTLIST -> PROJECT_TITLE_LINE DELIVERABLES:+                                          {% ([titleLine, deliverables]) => ({type: "project", name: titleLine.name, contacts: titleLine.contacts, deliverables: deliverables}) %}

PROJECT_TITLE_LINE -> "  " NAME " (" CONTACTS ")\n"                                        {% d => ( { name: d[1] , contacts: d[3] } ) %}

NAME -> [^(\n)]:*                                                                         {% d =>  d[0].join("") %}
CONTACTS -> ((CONTACTS "; " CONTACT ) | CONTACT)                                          {% function (d) { if (d[0][0].email) { return d[0] } else { return d[0][0][0].concat(d[0][0][2]) } } %}
CONTACT -> "\"" [^"]:+ "\" <" [^>]:+ ">"                                                  {% ([quote, name, sep, email, sep2]) => ({name: name.join(""), email:email.join("")}) %}

DELIVERABLES -> "    - " CHECKBOX " " ID ": " TITLE QUOTE:*                               {% ([prefix, checkbox, space, id, colon, title, quotes]) => ({type: "deliverable", id: id, done: checkbox, label: title, quotes: quotes}) %}

QUOTE -> CONTENTLINE:+ QUOTE_LOCATION                                                     {% d => ({type: "quote", content: d[0].join("\n"), location: d[1]}) %}
CONTENTLINE -> "      > " [^\n]:* "\n"                                                    {% d => d[1].join("") %}
QUOTE_LOCATION -> "        -- " [^\n]:* "\n"                                              {% d => d[1].join("") %}
