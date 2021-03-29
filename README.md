# oss-k8s-ansible
OSS研のk8sクラスタを立てるやつ

## 使い方
### 検証環境

- Virtualbox v6.1.18
- Vagrant v2.2.14
- host OS: macOS 11.2.3
- guest OS: ubuntu 18.04

### クラスター情報
- kubernetes v1.20.0

ツールとコンポーネント
- kubeadm v1.20.5
- kubectl v1.20.5
- kubelet v1.20.5

コンテナランタイム
- CRI-O v1.20.0

CNI
- flannel v1.13.0


### 実行コマンド
初回VM起動時： `vagrant up`  
2回目以降にansibleを回す場合： `vagrant provision`  

### 本番環境
- `ansible-playbook -i inventory/production cluster.yml`

※inventory/productionは自分で記述する必要があり
