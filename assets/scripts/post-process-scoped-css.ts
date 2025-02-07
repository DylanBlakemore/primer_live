import { join } from "path";
import * as prettier from "prettier";
import yargs from "yargs/yargs";
import { hideBin } from "yargs/helpers";
import { getCssText, storeCssText } from "./shared"

declare var process: {
  argv: string[];
};

function replaceTexts(text: string) {
  return text
    .replace(/:root/g, ":scope")
    .replace(/.__AMP__/g, "&")
    .replace(/(\[data-color-mode=[a-z-_]+\]\[data-\w+-theme\*?=[a-z-_]+\])/g, "$1 :scope")
    ;
}

function wrapInScope(text: string) {
  return `@scope (.primer-live) {
  ${text}
}`;
}

type ProcessFileOpts = {
  prettify: boolean;
};

async function processFile(
  path: string,
  { prettify: prettify }: ProcessFileOpts
) {
  let text = getCssText(path);
  text = replaceTexts(text);
  text = wrapInScope(text);
  if (prettify) {
    text = await prettier.format(text, {
      parser: "css",
    });
  }
  storeCssText(path, text);
}

const argv = yargs(hideBin(process.argv))
  .option("file", {
    type: "string",
    demandOption: true,
    description: "CSS file path",
  })
  .option("prettify", {
    type: "boolean",
    default: false,
    description: "Whether to prettify the result",
  })
  .parseSync();

const relativeFilePath = join("../", argv.file);

processFile(relativeFilePath, { prettify: argv.prettify });
