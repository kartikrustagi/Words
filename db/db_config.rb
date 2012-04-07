db_conf = YAML::load(File.open('config/db.yaml'))

DB = Sequel.connect(db_conf[db_conf["env"]])
