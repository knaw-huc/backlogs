const fs = require("fs");
const nearley = require("nearley");
const grammar = require("./grammar");

// Create a Parser object from our grammar.
const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar));

parser.feed(fs.readFileSync("structured-data.txt", "utf-8"));

fs.writeFileSync("structured-data.json", JSON.stringify(parser.results[0], undefined, 2), "utf-8");
