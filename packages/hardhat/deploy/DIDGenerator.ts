import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const deployDIDGenerator: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts } = hre;
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();

  console.log("Deploying DIDGenerator with account:", deployer);

  await deploy("DIDGenerator", {
    from: deployer,
    args: [], // No constructor arguments needed
    log: true,
  });
};

export default deployDIDGenerator;
deployDIDGenerator.tags = ["DIDGenerator"];
