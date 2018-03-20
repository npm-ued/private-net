## 本地测试mist和geth 操作 合约

* contract 合约目录
	* Guesser 猜猜看合约
	* 高级ICO合约
	* 简单icon合约

* genesis.json 创世区块配置

## 下载mist钱包

## 安装geth

## clone private-net

## 1.通过geth创建创世区块
```geth --datadir "./" init genesis.json```

## 2.创建自己的私有链条（启动相关rpc端口）
```geth --datadir "./" --rpc --rpcapi db,eth,net,web3,miner,personal --nodiscover console 2>>geth.log ```

## 3. 查看geth 日志 
```tail -f geth.log```

## 4. 创建账户(密码123)
```personal.newAccount("123")```

## 5. 开始挖矿
```miner.start()```

## 7. 停止挖矿
```miner.stop()```

## 8.查看账户余额
```eth.fromWei(eth.getBalance(eth.accounts[0]))```

## 9.通过mist钱包连上geth 
```"/Applications/Ethereum Wallet.app/Contents/MacOS/Ethereum Wallet" --rpc http://localhost:8545```

通过命令行将mist连接上本地的geth网络，开始部署合约测试即可










