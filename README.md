# Sphinx Template / CI

[![Build Status](https://travis-ci.org/sschmeier/tutorial-linux.svg?branch=master)](https://travis-ci.org/sschmeier/tutorial-linux) 

<!-- [![ReadTheDocs](https://readthedocs.org/projects/continuous-sphinx/badge/?version=latest)](https://continuous-sphinx.readthedocs.io/en/latest/?badge=latest) -->

An example of continuous integration, using [Travis-CI](https://travis-ci.org/),
and deployment, using [Netlify](https://www.netlify.com/), of a
[sphinx](http://www.sphinx-doc.org/) project. This is also referred to as **Docs as Code** and **DocOps**.

## Details

- Netlify runs Ubuntu Xenial 16.04 build, with python3.5 installed.
- Thus, need to use py3.5
  
## Installing Locally

1. Set up a [python virtual environment](https://packaging.python.org/guides/installing-using-pip-and-virtualenv/)
   named `venv` => `pip install virtualenv; virtualenv --python=python3.5 venv`.
2. Activate the `venv` environment => `source venv/bin/activate`
3. Install the dependencies inside of it by running  `pip install -r requirements_dev.txt`.
4. Run `make htmlwatch`.
5. Edit your rst-files.
6. Commit changes
7. Bump version using, e.g. `bump2version patch`
8. Push changes to remote
