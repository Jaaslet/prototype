Prototype is haskell library for integration contract language and parallel pricing engine.

Requirements
------------
GHC >= 7.8.3
In addition to libraries listed in .cabal file some system packages are required for hmatrix lib. Here is information on hmatrix requirements: https://github.com/albertoruiz/hmatrix/blob/master/INSTALL.md

Running
-------

Build pricing engine before running tests:
```
make compile_opencl
```

After that tests can be run using make:
```
make run_test
```
or using main function in Tests.hs.

Use `make run_web` to run web interface. Open `localhost:3000` in browser.

Emacs Haskell-mode users
------------------

Use `haskell-session-change-target` command to set proper target: `tests` when running tests/Tests.hs and `web` for web interface.
    
