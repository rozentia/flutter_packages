import IAuthRepository from '../../src/auth/Auth.i';
import User from '../../src/models/User';
export default class FakeRepository implements IAuthRepository {
    public users = [
        {
            email: 'email1@email.com',
            id: '01',
            name: 'Nelson',
            password: 'wrp98y%#$vbb',
            type: 'email',
        },
        {
            email: 'email2@email.com',
            id: '02',
            name: 'Deidre',
            password: 'wrcfffdddy%#$vbb',
            type: 'email',
        }
    ]

    public async find(email: string): Promise<User> {
        const user = this.users.find((x) => x.email === email)
        if (!user) return Promise.reject('User not found')

        return new User(
            user?.id,
            user?.name,
            user?.email,
            user?.password,
            user?.type,
        )
    }

    public async add(
        name: string,
        email: string,
        password: string,
        type: string,
    ): Promise<string> {
        const max = 9999
        const min = 1000
        const id = (Math.floor(Math.random() * (+max - +min)) + +min).toString()
        this.users.push({
            email,
            id,
            name,
            password,
            type,
        })
        return id
    }
}