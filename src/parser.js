const fs = require("fs");
const nearley = require("nearley");
const grammar = require("./grammar");

// Create a Parser object from our grammar.
const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar));

parser.feed(fs.readFileSync("structured-data.txt", "utf-8"));

let curMaxTags = 0;
let curWinner = undefined;
for (const result of parser.results) {
  let tagCount = 0;
  for (const projId in result) {
    if (projId !== "projects") {
      for (const task_or_block of result[projId]) {
        tagCount += task_or_block.tags.length;
        if (task_or_block.tasks) {
          for (const task of task_or_block.tasks) {
            tagCount += task.tags.length;
          }
        }
      }
    }
  }
  if (tagCount >= curMaxTags) {
    curMaxTags = tagCount
    curWinner = result;
  }
}

fs.writeFileSync("structured-data.json", JSON.stringify(curWinner, undefined, 2), "utf-8");
