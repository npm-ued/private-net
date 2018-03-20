pragma solidity ^0.4.16;
/**
 * The Demo contract does this and that...
 */
contract  Guesser {
    /* 公共变量 */
    string public name = ""; //代币名称
    uint256 public rental = 0; //总余额
    address public owner;
    address public addressA;
    address public addressB;


    /**
     * 判断当前合约调用者是否是管理员
     */
    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }

    /* 初始化合约，并且把初始的所有代币都给这合约的创建者
     * @param name 合约名称
     * @param gameSymbol 代币符号
     * @param decimalsUnits 代币后面的单位，小数点后面多少个0，以太币一样后面是是18个0
     */
    function Guesser(string gameName) public{
        require(bytes(gameName).length > 0); // validate input
        name = gameName;
        owner = msg.sender;
    }   

    //赔付
    function payBack(uint256 divisor) public onlyOwner {
        address senderTarget;
        uint timeStr = uint(keccak256(divisor,msg.sender));
        bool flag = bool(timeStr%2==0);//偶数是true，奇数是false
        if(flag){ //偶数是大
            senderTarget = addressA;
        }else{ // 奇数是小
            senderTarget = addressB;
        }
        uint256 amount =  rental*3/4;
        //检查合约的余额是否充足
        require(this.balance >= amount);
        rental -= amount;
        senderTarget.transfer(amount);
    }

    /**
     * 使用以太币买大
     */
    function buyA() payable public {
        addressA = msg.sender;
        rental += msg.value;
    }

    // 使用以太币买小
    function buyB () payable public {
        addressB = msg.sender;
        rental += msg.value;
    }
}
