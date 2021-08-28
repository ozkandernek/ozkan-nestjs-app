
# Kullanılan teknolojiler ve ortamlar.

- Docker,Docker hub registry
- GCP(Kubeadm ile 1 master-3 worker içeren cluster yapısı kuruldu.),GCP (1 VPC instance icerisinde Nodejs 14.17.5 en son kararlı sürüm calisiyor ve yarn paket yoneticisi)  uygulama bu instance üzerinde dockerize ediliyor aradaki bağlantılar github self-runner ile sağlandı. 
- CI + CD pipeline olarak ilk defa github actions workflow denedim. 

- Kuralları 1 VPC instance icerisinde local ortamda Nodejs 14.17.5 yarn ile test ediliyor,aynı sürümler docker içerisinde tanımlandı. 
 
 ```
 Lint kurallari geciyor mu: `yarn lint`
 Formatlama kurallarina uyuyor mu: `yarn format:check`
 Unit testler geciyor mu: `yarn test`
 Coverage threshold'una uyulmus mu?: `yarn test:cov`
 E2E testler geciyor mu: `yarn test:e2e`
 ```

- Kubermetes ortamanında nginx ingress deploy edilip,cert-manager ile sertifikalar alınması sağlandı.

- Github workflow içerisine slack kanalına mesaj atan bir action eklendi.

- CI + CD workflow stage ortamına deploy yapıldığında webhook ile slack kanalında bildirimde bulunuyor.


* Olusturulan ortamlara erisim [stage](https://stg.atolye.ozdernek.dev)  , [prod](https://prod.atolye.ozdernek.dev) adreslerinden uygulamalara erisim saglanabilir.



<img width="1259" alt="slack-bildirim" src="https://user-images.githubusercontent.com/30561237/130888308-1b729869-2cb7-4cfd-b2e8-c96a8dda670c.png">









 
