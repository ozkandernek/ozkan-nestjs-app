
# Kullanılan teknolojiler ve ortamlar.

- Docker,Docker hub registry
- GCP(Kubeadm ile 1 master - 3 worker içeren Kubernetes cluster yapısı kuruldu.)
- GCP (1 VPC instance icerisine Nodejs 14.17.5 en son kararlı sürüm ,Yarn  ve Docker kuruldu.)  uygulama bu instance üzerinde codebase test edilip dockerize ediliyor. Bahsedilen iş akışı github workflow ile VPC üzerinde konumlandırılan  self-runner vasıtası ile sağlanmaktadır. 
- CI + CD pipeline olarak  github actions workflow kullanıldı.

- VPC instance icerisinde aşağıdaki kurallar local ortamda Nodejs 14.17.5 ve yarn ile test ediliyor,aynı sürümler docker imaj içerisinde tanımlandı. 
 
 ```
 Lint kurallari geciyor mu: `yarn lint`
 Formatlama kurallarina uyuyor mu: `yarn format:check`
 Unit testler geciyor mu: `yarn test`
 Coverage threshold'una uyulmus mu?: `yarn test:cov`
 E2E testler geciyor mu: `yarn test:e2e`
 ```
* Bu işlemlerden sonra Docker hub registry kullanılarak imajlar public repolara eklenmiştir.Daha sonra Kubernetes manifestolarında kullanıldı.

- Kubernetes ortamanında nginx ingress deploy edilip,cert-manager ile sertifikaların alınması sağlandı.

- Github workflow içerisine slack kanalına mesaj atan bir action eklendi.

- CI + CD workflow ile uygulama stage ortamına deploy edildiğinde  webhook ile slack kanalında bildirimde bulunuyor.






<img width="1259" alt="slack-bildirim" src="https://user-images.githubusercontent.com/30561237/130888308-1b729869-2cb7-4cfd-b2e8-c96a8dda670c.png">









 
