# Documentation Site

This site is built and generated via [Antora Docs](https://docs.antora.org/antora/latest/).

## Installation

- [Install and Run Quickstart](https://docs.antora.org/antora/latest/install-and-run-quickstart/)

```bash
npm i -D -E @antora/cli@3.1 @antora/site-generator@3.1
```

## Usage

Using the [Makefile](./Makefile):

* **Generate the site** (HTML, CSS, etc)

   ```bash
   make html
   ```

   * This generates the site to `build/`, you can view it by opening `build/index.html` in a browser.

* **Create a new module under a category**

   ```bash
   make module
   ```

   * You'll need to specify the module name (i.e. `Docker`) and module category (i.e. `learning`):
   * Example:

     ```console
     ➜  inf0rmatiker.github.io git:(master) ✗ make module
     scripts/make_module.sh
     Module name:
     My Module
     Module category (i.e. learning, blog):
     learning

     Created structure in modules/learning/pages/my-module:
     modules/learning/pages/my-module
     └── my-module.adoc

     1 directory, 1 file

     Created new entry in modules/learning/partials/nav.adoc

     * My Module
     ** xref:docs-site:learning:my-module/my-module.adoc[My Module]
     ```
