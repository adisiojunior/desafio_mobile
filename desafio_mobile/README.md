# desafio_mobile

## Teslas
# Tela de Login
![telaDeLogin](https://user-images.githubusercontent.com/20409822/122675164-8b820200-d1ae-11eb-938f-73a5bca7d204.png)
# Registrar
![Registrar](https://user-images.githubusercontent.com/20409822/122674715-c71bcc80-d1ac-11eb-8212-25a57ec0ba45.png)
# Recuperar Senha
![RecuperarSenha](https://user-images.githubusercontent.com/20409822/122674716-c7b46300-d1ac-11eb-9bf6-82c68d474bcd.png)
# Email Errado
![CasoEmailErrado](https://user-images.githubusercontent.com/20409822/122674719-c7b46300-d1ac-11eb-89a2-35bd406879e2.png)
# Caso não digite nada nos campos
![CasoNaoDigiteNada](https://user-images.githubusercontent.com/20409822/122674720-c84cf980-d1ac-11eb-80d9-60c707a92cb4.png)
# Login com Facebook
![LoginComFacebook](https://user-images.githubusercontent.com/20409822/122674721-c84cf980-d1ac-11eb-9443-96f1428659e3.png)
# Sua localização
![Screenshot_1624150085](https://user-images.githubusercontent.com/20409822/122675152-7dcc7c80-d1ae-11eb-827d-0b112d823233.png)




## Participants

[<img src="https://avatars.githubusercontent.com/u/20409822?v=4" width="75px;"/>](https://github.com/adisiojunior)

[Adísio Fialho Jr](https://github.com/adisiojunior)

## Feito 
- [x] Tela de login
- [x] Tela de Singup
- [x] Tela de esqueceu a senha
- [x] Tela de Home (Localizaçaõ em tempo real)

## Techs

- [x] Flutter e Dart
- [x] Editor Vscode
- [x] Firebase
- [x] Facebook For Developers

## Bibliotecas
    Para criação do project
    Criando o projeto em Flutter:
    -Foi utilizado o vscode;
    -Foi utilizado AndroidStudio, apenas o seu simulador
    - Comando para criação do projeto em flutter:
        - crtl+shift+p
        -Flutter: New Aplication Projecg
        -Abrindando o simulador pelo terminal:
            -  flutter emulators --launch "nomeDoEmulador"
            - Dentro do vscode, dar o comando Ctrl+shift+D
    
    Vamos instalar duas dependencias:
    -firebase_core:
    plug-in é responsável por conectar seu aplicativo Flutter ao projeto Firebase.
     O plugin deve ser instalado e inicializado antes do uso de qualquer outro plugin 
     FlutterFire. Ele fornece funcionalidades básicas, como:
        - Inicializando o FlutterFire .
        - Criação de instâncias secundárias do aplicativo Firebase .
    -firebase_auth:
    Firebase Authentication é facilitar o desenvolvimento de um sistema de autenticação seguro,
    além de melhorar a experiência de login e integração para os usuários finais.

    Criado o projeto no site firebase, vamos realizar as configurações
        Entrando em AndroidManifest.xml, podemos encontrar o package que vamos usar
        package="com.example.desafio_mobile"
    Depois de colocar o pacote devemos gerar o SHA-1
        -abrir o terminar e gerar o código:
        keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
        Com isso vai aparecer a SHA-1
    Agora Precisa colocar o arquivo google-service dentro do projeto
    Agora entrar no build.gradle
        colocar: minSdkVersion 21
        multiDexEnabled true e
        apply plugin: 'com.google.gms.google-services'
        dependencias:
            implementation 'androidx.multidex:multidex:2.0.1'
        No outro build.gradle, certificar de quê está forcendo ao google
            colocando a dependencias:
                classpath 'com.google.gms:google-services:4.3.3'

    Criando o pacote services, e o arquivo authservices, para conter a lógica de autenticação
    Criando um arquivo, para tratamento de erros

    Colocando a dependencia: flutter_login_facebook, para poder realizar login com facebook
        - abrinando o site do facebook para desenvolvedor
        - criando o app
        - depois adicionar o aplicativo no Firebase
    Comando para encontrar hashes chaves:
        cd para entrar na pasta da JDK
        comando para o window: 
        keytool -exportcert -alias androiddebugkey -keystore "C:debug.keystore" | "C:\OpenSSl\bin\openssl" sha1 -binary | "C:\OpenSSL\bin\openssl" base64

    Intalação das dependencia de localização
        -geolocator:
            Um plug-in de geolocalização do Flutter que fornece acesso fácil a serviços de localização específicos da plataforma 
            ( FusedLocationProviderClient ou, se não estiver disponível, o LocationManager no Android e CLLocationManager no iOS).  
                Configurações: 
                -AndroidManifest:
                <uses-permission android:name="android.permission.ACSESS_FINE_LOCATION"/>
                <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
