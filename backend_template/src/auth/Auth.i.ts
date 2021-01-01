import User from "../models/User";

export default interface IAuthRepository {
    find(email: string): Promise<User>
    add(name: string, email: string, passwordHash: string, type: string): Promise<string>
}