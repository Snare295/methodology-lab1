# Quadratic Equation Solver on Dart

App have 2 modes to interact with input of coefficients a,b,c:

- Interactive  1: write sequently coefficients of quadratic equation,
   can receive numbers as 2, 13.0, .5, 2.1E3
- Non-interactive or File 2: write a path to .txt file, where layout is
   [a`<space>`b`<space>`c], for better understanding see exm.txt

## How to run

Just run lab1.exe from bin folder

## How to install

1.1 Use official guideline: https://dart.dev/get-dart

1.2 Fast install for windows:

1.2.1 Open powershell with admin rights

1.2.2 Write commands below (skip to last if you installed chocolatery)

```sh
Set-ExecutionPolicy AllSigned
```

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

```sh
choco install dart-sdk
```

### 2. Clone repository

```sh
git clone https://github.com/Snare295/methodology-lab1 
```

### 3. Run <code> dart run</code> in folder of clone

trash for revert commit