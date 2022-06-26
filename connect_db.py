from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm.session import sessionmaker
from sqlalchemy import Column, String, Date, Time
import config

engine = create_engine(config.DB_URI, echo=True)
base = declarative_base()
session = sessionmaker(bind=engine)()


class userpg(base):
    __tablename__ = 'userpg'
    user_login = Column(String, primary_key=True, nullable=False)
    Server = Column(String, primary_key=True)
    client = Column(String, primary_key=True)
    Date = Column(Date, primary_key=True)
    Time = Column(Time, primary_key=True)


base.metadata.create_all(engine)
