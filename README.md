
# Hide Proofs LaTeX Package

Define a starred proof environment `proof*` that hides its contents unless the document is marked as `final`.

## Overview

This package introduces an alternate proof environment, `proof*`, which conditionally hides or shows its contents based on the document mode (`draft`, `final`, or default). This is useful for omitting formal proofs from draft versions while retaining them in final documents.
The motivation for this package is to reduce the clutter in large files by omitting long proofs, allowing authors to focus their attention on results or proofs that are currently works in-progress.

## Features

- Defines a `proof*` environment with optional argument.
- Automatically hides proofs in non-final documents (configurable).
- Customizable hidden message and styling.

## Usage

### Basic Example

```latex
\documentclass{article}
\usepackage{hideproofs}

\begin{document}

\begin{proof*}
  This proof will be hidden unless the document is in final mode.
\end{proof*}

\end{document}
```


## Package options
| Key             | Type   | Description                                                 | Default                    |
| --------------- | ------ | ----------------------------------------------------------- | -------------------------- |
| `hideInDraft`   | bool   | Hide proofs in draft mode.                                  | `true`                     |
| `hideInFinal`   | bool   | Hide proofs in final mode.                                  | `false`                    |
| `hideInDefault` | bool   | Hide proofs in default mode (neither draft nor final).      | `true`                     |
| `show`          | bool   | Always show proofs, regardless of mode.                     | `false`                      |
| `hide`          | bool   | Always hide proofs, regardless of mode.                     | `false`                      |
| `message`       | string | Text shown in place of hidden proof.                        | `Proof hidden.` |
| `color`         | string | Color of the hidden message (if `color` package is loaded). | `blue`                     |


## Optional Argument to Change "Proof." Header

The `proof*` environment matches the behavior of the `proof` environment for using an optional argument to change the proof heading from "proof.":
```latex
\begin{proof*}[Proof Sketch]
This labeled proof will be hidden unless visible.
\end{proof*}
```

## Change Log

### v1.0 (2025/06/15)
Initial version

## License
The `hideproofs` package is licensed under the [LaTeX Project Public License](https://www.latex-project.org/lppl/).




# Development

## Packaging and Uploading `hideproofs` to CTAN

We are using the `makedtx` tool to package the documentation and `.sty` files into a `.dtx` file.
Often, `makedtx` is packaged with your LaTeX installation, so it does not need to be installed separately. 
Run 
```bash
makedtx --version
```
to check it is installed. 
To build the `.dtx` file, run 
```bash
makedtx -src "hideproofs\.sty=>hideproofs.sty" -doc hideproofs-doc.tex hideproofs
```
In the `-src` argument, the left-hand side of `=>` is a regular expression indicating the source file (hence the need to escape `\.`) and the right-hand side is the output file.