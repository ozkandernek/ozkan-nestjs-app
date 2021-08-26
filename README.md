
# Kullanılan Teknolojiler ve Ortamlar.

- Docker,Docker hub registry
- GKE(Kubeadm ile 1 master-3 worker içeren cluster yapısı kuruldu.),GCP (1 VPC instance icerisinde Nodejs 14.5.7 en son kararlı sürüm calisiyor ve yarn paket yoneticisi)  uygulama bu instance üzerinde dockerize ediliyor aradaki bağlantılar github self-runner ile sağlandı. 
- CI + CD pipeline olarak ilkkez github actions workflow denedim. 

- Kuralları 1 VPC instance icerisinde local ortamda Nodejs 14.5.7 yarn ile test ediliyor,aynı sürümler docker içerisinde tanımlandı. 
 Lint kurallari geciyor mu: `yarn lint`
 Formatlama kurallarina uyuyor mu: `yarn format:check`
 Unit testler geciyor mu: `yarn test`
 Coverage threshold'una uyulmus mu?: `yarn test:cov`
 E2E testler geciyor mu: `yarn test:e2e`
 

- Kubermetes ortamanında Nginx ingress deploy edilip,cert-manager ile sertifikalar alınması sağlandı.

- Github workflow içerisine slack kanalına mesaj atan bir action eklendi.

- CI + CD workflow stage ortamına deploy yapıldığında webhook ile slack kanalında bildirimde bulunuyor.

* stg.atolye.ozdernek.dev ,prod.atolye.ozdernek.dev adreslerinden uygulamalara erisim saglanabilir.


<img width="1259" alt="slack-bildirim" src="https://user-images.githubusercontent.com/30561237/130888308-1b729869-2cb7-4cfd-b2e8-c96a8dda670c.png">






# Atolye15 Demo

Bu ekrana sadece Hello world yazdiran basit bir Nest.JS uygulamasi. Senden asagidaki sekilde bir pipeline olusturmani bekliyoruz;

Git repomuzda `master` ve `develop` branch'leri bulunuyor. Insanlar `develop` branch'ine feature branch'ler uzerinden yeni ozellikler ekleyebilirler. Bunun icin de soyle bir pipeline planliyoruz;

Kisi gerekli commit'leri attiktan sonra CI (Biz genelde CircleCI kullaniyoruz ama sen istedigini kullanabilirsin) aracinda sirasiyla asagidaki kontroller calisir;

- Lint kurallari geciyor mu: `yarn lint`
- Formatlama kurallarina uyuyor mu: `yarn format:check`
- Unit testler geciyor mu: `yarn test`
- Coverage threshold'una uyulmus mu?: `yarn test:cov`
- E2E testler geciyor mu: `yarn test:e2e`

Tum bu kontroller pass olduktan sonra PR `develop` ile birlestigi zaman senin yazmis oldugun bu projeye dahil edecegin `Dockerfile`'daki stepleri takip eden herhangi bir builder'da image build alip onu herhangi bir private container registy'e yollamani bekliyoruz. GCloud'ta oldugunu varsayarsak bu araclar cloud build ve GCR olacaktir. Sen istedigin cozumu kullanabilirsin.

Image registry'e gittikten sonra latest tag'li bu image'in Kubernetes tarafinda senin yazdigin manifestolara uygun olarak `stage` namespace'inde yayina girmesini istiyoruz. Bu asamada ilgili kisiye mail gidebilir. Daha sonra Git tarafinda `develop`'tan `master`'a PR acildiginda tum surec tekrar yukaridaki gibi isleyip en sonunda `production` namespace'inde Kubernetes uzerinde yayinda olmasini bekliyoruz.

Kubernetes tarafinda da Let's encrypt uzerinden auto provision ile SSL ayarlarsan da super olur.

Pipeline'in istedigin kismini es gecebilir veya kendince daha dogru oldugunu dusundugun bir hale getirebilirsin.

NOT: Dependency'lerin kurulmasi icin proje dizininde `yarn` komutunun calistirilmasi gerekiyor.

NOT: Uygulama `yarn start:prod` komutu ile ayaga 3000 portunda ayaga kalkiyor.



 
