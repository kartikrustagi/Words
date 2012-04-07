db_conf = YAML::load(File.open('config/db.yaml'))
env = db_conf["env"]
if env == "development"
	DB = Sequel.connect(db_conf[db_conf["env"]])
else
	DB = Sequel.connect(ENV['DATABASE_URL'])
end
