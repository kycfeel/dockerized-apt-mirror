Well dockerized, and portable APT mirror kit to build your own one easily.

## Usage

> Detailed guide & introduction are on [here](https://kycfeel.github.io/2019/07/22/Docker로-쉽게-올리는-나만의-APT-미러-서버/) (written in Korean).

### Bringing up the server

> By default, Your local docker will build a new image for running APT mirror on your first-time launch. If you want to skip this process, You can modify `docker-compose` file to pull [`kycfeel/dockerized-apt-mirror`](https://cloud.docker.com/repository/docker/kycfeel/dockerized-apt-mirror/general) image from Docker Hub instead. 

```
docker-compose up -d
```

This command will bring up every necessary components on your local machine with DEFAULT configuations.

- Mirror Ubuntu 16.04 LTS, 18.04 LTS, 19.04, 19.10.
- Sync archives every 1 hour.

To customize this setups, Please open `mirror.list` and `crontab/apt-mirror` files and reference the guide down below.

#### Customizing `mirror.list`

Once you open the `mirror.list` file, You'll see bunch of URLs pre-defined on it. Those are the URLs for reaching official Ubuntu archive for downloading packages. Following names right behind of URLs are the version names of Ubuntu distros (xenial, bionic, etc... ).

The names you can see behind of Ubuntu distro versions, such as `restricted`, `main`, `universe`, those are for specifying different software repository to mirror. You can check the details on [here](https://www.howtogeek.com/194247/whats-the-difference-between-main-restricted-universe-and-multiverse-on-ubuntu/).

You can change these values on the file based on your needs and situation. Such as changing archive URLs to different mirror which is more physically closer to you, or removing support for `restricted` packages.

#### Customizing `crontab/apt-mirror`

`crontab/apt-mirror` is a simple `crontab` rule for periodically running `apt-mirror` pull to syncronize local mirror's data as same as remote archive's one.

By default, Crontab rule is set as `0 4	* * *`, which means run `apt-mirror` pull in every 04:00 (everyday). You can modify this value to whatever you want. For setting up crontab rule easily, good to also reference [crontab.guru](https://crontab.guru). 

### Bringing down the server

```
docker-compose down
```

Easy!