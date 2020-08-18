import MoviesRepository from "./MoviesRepository";
import UsersRepository from "./UsersRepository";

const repositories = {
  movies: MoviesRepository,
  users: UsersRepository,
};

export const RepositoryFactory = {
  get: (name) => repositories[name],
};
