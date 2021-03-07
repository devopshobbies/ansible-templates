## Documentation

* Explore the Terraform for Terraform [CLI](https://www.terraform.io/downloads.html) >= v1.0+
* Explore the Nodejs for npm [CLI](https://nodejs.org/en/) >= v14+
* Explore the Yarn for Yarn [CLI](https://classic.yarnpkg.com/en/docs/install#debian-stable) >= v1.21 (optional - NPM will work as an alternative)
* Explore the CDK for cdktf [CLI](https://github.com/hashicorp/terraform-cdk#build)


Add your AWS credentials as two environment variables, AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, replacing AAAAAA with each respective values.
```shell
$ export AWS_ACCESS_KEY_ID=AAAAAA
$ export AWS_SECRET_ACCESS_KEY=AAAAA
```

# typescript-aws-ec2

A CDK for Terraform application in TypeScript for EC2 configuraiton.

## Usage

Install project dependencies

```shell
yarn install
```

Generate CDK for Terraform constructs for Terraform provides and modules used in the project.

```bash
cdktf get
```

You can now edit the `main.ts` file if you want to modify any code.

```typescript
vim main.ts
import { Construct } from "constructs";
import { App, TerraformStack } from "cdktf";
import { AwsProvider, ec2 , vpc} from "./.gen/providers/aws";

class MyStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id);

    new AwsProvider(this, "aws", {
      region: "us-east-1",
    });

    const instancesg = new vpc.SecurityGroup(this, "instancesg", {
      name: "CDKtf-TypeScript-Demo-sg",
      description: "Allows traffic to the instance.",
      ingress: [
        {
          protocol: "tcp",
          fromPort: 80,
          toPort: 80,
          cidrBlocks: ["0.0.0.0/0"],
        },
        {
          protocol: "tcp",
          fromPort: 22,
          toPort: 22,
          cidrBlocks: ["0.0.0.0/0"],
        },
        {
          protocol: "tcp",
          fromPort: 443,
          toPort: 443,
          cidrBlocks: ["0.0.0.0/0"],
        },
      ],
      egress: [
        {
          protocol: "-1",
          fromPort: 0,
          toPort: 0,
          cidrBlocks: ["0.0.0.0/0"],
        },
      ],
      tags: {
        Name: this.node.tryGetContext("Name"),
        Team: this.node.tryGetContext("Team"),
        Company: this.node.tryGetContext("Company"),
      },
    });

    new ec2.Instance(this, "compute", {
      ami: "ami-03d315ad33b9d49c4", //Ubuntu Server 20.04 LTS (HVM)
      instanceType: "t2.micro",
      keyName: "DevOps",     //You should create Keyname manually before running code
      vpcSecurityGroupIds: [instancesg.id],
      tags: {
        Name: this.node.tryGetContext("Name"),
        Team: this.node.tryGetContext("Team"),
        Company: this.node.tryGetContext("Company"),
      },
    });

  }
}

const app = new App({ context: { Name: "CDKtf-TypeScript-Demo" , Team: "DevOps", Company: "Your company"} });
new MyStack(app, "typescript-aws");
app.synth();
```

Compile the TypeScript application

```bash
tsc
```
At this step you can run code with two different way:

# The first way:

Generate Terraform configuration

```bash
cdktf synth
```

The above command will create a folder called `cdktf.out` that contains all Terraform JSON configuration that was generated.

Run Terraform commands

```bash
cd cdktf.out
terraform init
terraform plan
terraform apply
```

# The second way:

Run cdktf commands

```bash
cdktf deploy
```
