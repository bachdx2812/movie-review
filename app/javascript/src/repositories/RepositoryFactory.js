import MoviesRepository from "./MoviesRepository";
import UsersRepository from "./UsersRepository";
import ComicsRepository from "./ComicsRepository";
import PublishersRespository from "./PublishersRespository";

const repositories = {
  movies: MoviesRepository,
  users: UsersRepository,
  comics: ComicsRepository,
  publishers: PublishersRespository,
};

export const RepositoryFactory = {
  get: (name) => repositories[name],
};
